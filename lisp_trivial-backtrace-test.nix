
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivial-backtrace, 
   lisp_lift, lisp_trivial-backtrace,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lift lisp_trivial-backtrace  ];
      inherit stdenv;
      systemName = "trivial-backtrace-test";
      
      sourceProject = "${lisp-project_trivial-backtrace}";
      patches = [];
      lisp_dependencies = "${lisp_lift} ${lisp_trivial-backtrace}";
      name = "lisp_trivial-backtrace-test-20160531-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
