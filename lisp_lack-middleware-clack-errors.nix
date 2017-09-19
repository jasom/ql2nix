
{ buildLispPackage, stdenv, fetchurl, lisp-project_clack-errors, 
   lisp_djula, lisp_trivial-backtrace, lisp_local-time, lisp_closer-mop, lisp_clack,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_djula lisp_trivial-backtrace lisp_local-time lisp_closer-mop lisp_clack  ];
      inherit stdenv;
      systemName = "lack-middleware-clack-errors";
      
      sourceProject = "${lisp-project_clack-errors}";
      patches = [];
      lisp_dependencies = "${lisp_djula} ${lisp_trivial-backtrace} ${lisp_local-time} ${lisp_closer-mop} ${lisp_clack}";
      name = "lisp_lack-middleware-clack-errors-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
