
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-bootstrap, 
   lisp_cl-bootstrap, lisp_fiveam,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-bootstrap lisp_fiveam  ];
      inherit stdenv;
      systemName = "cl-bootstrap-test";
      
      sourceProject = "${lisp-project_cl-bootstrap}";
      patches = [];
      lisp_dependencies = "${lisp_cl-bootstrap} ${lisp_fiveam}";
      name = "lisp_cl-bootstrap-test-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
