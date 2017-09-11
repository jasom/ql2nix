
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivial-channels, 
   lisp_bordeaux-threads, lisp_trivial-timeout,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_bordeaux-threads lisp_trivial-timeout  ];
      inherit stdenv;
      systemName = "trivial-channels";
      
      sourceProject = "${lisp-project_trivial-channels}";
      patches = [];
      lisp_dependencies = "${lisp_bordeaux-threads} ${lisp_trivial-timeout}";
      name = "lisp_trivial-channels-20160421-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
