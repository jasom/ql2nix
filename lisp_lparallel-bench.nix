
{ buildLispPackage, stdenv, fetchurl, lisp-project_lparallel, 
   lisp_trivial-garbage, lisp_bordeaux-threads, lisp_alexandria,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-garbage lisp_bordeaux-threads lisp_alexandria  ];
      inherit stdenv;
      systemName = "lparallel-bench";
      
      sourceProject = "${lisp-project_lparallel}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-garbage} ${lisp_bordeaux-threads} ${lisp_alexandria}";
      name = "lisp_lparallel-bench-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
