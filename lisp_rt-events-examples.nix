
{ buildLispPackage, stdenv, fetchurl, lisp-project_rt-events, 
   lisp_bordeaux-threads, lisp_rt-events,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_bordeaux-threads lisp_rt-events  ];
      inherit stdenv;
      systemName = "rt-events.examples";
      
      sourceProject = "${lisp-project_rt-events}";
      patches = [];
      lisp_dependencies = "${lisp_bordeaux-threads} ${lisp_rt-events}";
      name = "lisp_rt-events-examples-20160318-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
