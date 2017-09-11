
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivial-gray-streams, 
   lisp_trivial-gray-streams,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-gray-streams  ];
      inherit stdenv;
      systemName = "trivial-gray-streams-test";
      
      sourceProject = "${lisp-project_trivial-gray-streams}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-gray-streams}";
      name = "lisp_trivial-gray-streams-test-20140826-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
