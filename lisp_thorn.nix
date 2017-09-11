
{ buildLispPackage, stdenv, fetchurl, lisp-project_thorn, 
   lisp_common-doc,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_common-doc  ];
      inherit stdenv;
      systemName = "thorn";
      
      sourceProject = "${lisp-project_thorn}";
      patches = [];
      lisp_dependencies = "${lisp_common-doc}";
      name = "lisp_thorn-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
