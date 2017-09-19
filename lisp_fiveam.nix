
{ buildLispPackage, stdenv, fetchurl, lisp-project_fiveam, 
   lisp_trivial-backtrace, lisp_net-didierverna-asdf-flv, lisp_alexandria,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-backtrace lisp_net-didierverna-asdf-flv lisp_alexandria  ];
      inherit stdenv;
      systemName = "fiveam";
      
      sourceProject = "${lisp-project_fiveam}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-backtrace} ${lisp_net-didierverna-asdf-flv} ${lisp_alexandria}";
      name = "lisp_fiveam-v1.3";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
