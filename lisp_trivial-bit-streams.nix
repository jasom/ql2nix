
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivial-bit-streams, 
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
      systemName = "trivial-bit-streams";
      
      sourceProject = "${lisp-project_trivial-bit-streams}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-gray-streams}";
      name = "lisp_trivial-bit-streams-20110320-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
