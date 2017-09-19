
{ buildLispPackage, stdenv, fetchurl, lisp-project_clack-errors, 
   lisp_cl-markup, lisp_djula, lisp_trivial-backtrace, lisp_local-time, lisp_closer-mop, lisp_clack,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-markup lisp_djula lisp_trivial-backtrace lisp_local-time lisp_closer-mop lisp_clack  ];
      inherit stdenv;
      systemName = "clack-errors-demo";
      
      sourceProject = "${lisp-project_clack-errors}";
      patches = [];
      lisp_dependencies = "${lisp_cl-markup} ${lisp_djula} ${lisp_trivial-backtrace} ${lisp_local-time} ${lisp_closer-mop} ${lisp_clack}";
      name = "lisp_clack-errors-demo-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
