
{ buildLispPackage, stdenv, fetchurl, lisp-project_minheap, 
   lisp_lisp-unit, lisp_minheap,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lisp-unit lisp_minheap  ];
      inherit stdenv;
      systemName = "minheap-tests";
      
      sourceProject = "${lisp-project_minheap}";
      patches = [];
      lisp_dependencies = "${lisp_lisp-unit} ${lisp_minheap}";
      name = "lisp_minheap-tests-20160628-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
