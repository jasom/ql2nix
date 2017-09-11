
{ buildLispPackage, stdenv, fetchurl, lisp-project_circular-streams, 
   lisp_fast-io, lisp_trivial-gray-streams,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fast-io lisp_trivial-gray-streams  ];
      inherit stdenv;
      systemName = "circular-streams";
      
      sourceProject = "${lisp-project_circular-streams}";
      patches = [];
      lisp_dependencies = "${lisp_fast-io} ${lisp_trivial-gray-streams}";
      name = "lisp_circular-streams-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
