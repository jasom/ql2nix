
{ buildLispPackage, stdenv, fetchurl, lisp-project_stmx, 
   lisp_alexandria, lisp_bordeaux-threads, lisp_closer-mop, lisp_log4cl, lisp_trivial-garbage,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_bordeaux-threads lisp_closer-mop lisp_log4cl lisp_trivial-garbage  ];
      inherit stdenv;
      systemName = "stmx";
      
      sourceProject = "${lisp-project_stmx}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_bordeaux-threads} ${lisp_closer-mop} ${lisp_log4cl} ${lisp_trivial-garbage}";
      name = "lisp_stmx-stable-e4dace56-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
