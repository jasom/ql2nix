
{ buildLispPackage, stdenv, fetchurl, lisp-project_odd-streams, 
   lisp_trivial-gray-streams,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-gray-streams  ];
      inherit stdenv;
      systemName = "odd-streams";
      
      sourceProject = "${lisp-project_odd-streams}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-gray-streams}";
      name = "lisp_odd-streams-0.1.2";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
