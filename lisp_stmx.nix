
{ buildLispPackage, stdenv, fetchurl, lisp-project_stmx, 
   lisp_trivial-garbage, lisp_closer-mop, lisp_log4cl, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-garbage lisp_closer-mop lisp_log4cl lisp_alexandria  ];
      inherit stdenv;
      systemName = "stmx";
      
      sourceProject = "${lisp-project_stmx}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-garbage} ${lisp_closer-mop} ${lisp_log4cl} ${lisp_alexandria}";
      name = "lisp_stmx-stable-e4dace56-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
