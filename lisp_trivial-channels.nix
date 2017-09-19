
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivial-channels, 
   lisp_trivial-timeout, lisp_bordeaux-threads,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-timeout lisp_bordeaux-threads  ];
      inherit stdenv;
      systemName = "trivial-channels";
      
      sourceProject = "${lisp-project_trivial-channels}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-timeout} ${lisp_bordeaux-threads}";
      name = "lisp_trivial-channels-20160421-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
