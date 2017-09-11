
{ buildLispPackage, stdenv, fetchurl, lisp-project_clack, 
   lisp_lack, lisp_clack, lisp_clack-test, lisp_trivial-backtrace, lisp_marshal, lisp_circular-streams,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lack lisp_clack lisp_clack-test lisp_trivial-backtrace lisp_marshal lisp_circular-streams  ];
      inherit stdenv;
      systemName = "clack-v1-compat";
      
      sourceProject = "${lisp-project_clack}";
      patches = [];
      lisp_dependencies = "${lisp_lack} ${lisp_clack} ${lisp_clack-test} ${lisp_trivial-backtrace} ${lisp_marshal} ${lisp_circular-streams}";
      name = "lisp_clack-v1-compat-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
