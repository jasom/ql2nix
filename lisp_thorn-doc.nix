
{ buildLispPackage, stdenv, fetchurl, lisp-project_thorn, 
   lisp_thorn,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_thorn  ];
      inherit stdenv;
      systemName = "thorn-doc";
      
      sourceProject = "${lisp-project_thorn}";
      patches = [];
      lisp_dependencies = "${lisp_thorn}";
      name = "lisp_thorn-doc-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
