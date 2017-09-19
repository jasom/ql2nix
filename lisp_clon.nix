
{ buildLispPackage, stdenv, fetchurl, lisp-project_clon, 
   lisp_trivial-timers, lisp_bordeaux-threads,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-timers lisp_bordeaux-threads  ];
      inherit stdenv;
      systemName = "clon";
      
      sourceProject = "${lisp-project_clon}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-timers} ${lisp_bordeaux-threads}";
      name = "lisp_clon-20110320-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
