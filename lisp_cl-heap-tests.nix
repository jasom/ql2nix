
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-heap, 
   lisp_cl-heap, lisp_xlunit,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-heap lisp_xlunit  ];
      inherit stdenv;
      systemName = "cl-heap-tests";
      
      sourceProject = "${lisp-project_cl-heap}";
      patches = [];
      lisp_dependencies = "${lisp_cl-heap} ${lisp_xlunit}";
      name = "lisp_cl-heap-tests-0.1.6";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
