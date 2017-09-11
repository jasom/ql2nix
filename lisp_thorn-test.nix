
{ buildLispPackage, stdenv, fetchurl, lisp-project_thorn, 
   lisp_fiveam, lisp_thorn, lisp_thorn-doc,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fiveam lisp_thorn lisp_thorn-doc  ];
      inherit stdenv;
      systemName = "thorn-test";
      
      sourceProject = "${lisp-project_thorn}";
      patches = [];
      lisp_dependencies = "${lisp_fiveam} ${lisp_thorn} ${lisp_thorn-doc}";
      name = "lisp_thorn-test-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
