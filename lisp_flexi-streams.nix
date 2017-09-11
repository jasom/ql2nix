
{ buildLispPackage, stdenv, fetchurl, lisp-project_flexi-streams, 
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
      systemName = "flexi-streams";
      
      sourceProject = "${lisp-project_flexi-streams}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-gray-streams}";
      name = "lisp_flexi-streams-1.0.15";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
