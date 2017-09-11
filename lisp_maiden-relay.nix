
{ buildLispPackage, stdenv, fetchurl, lisp-project_maiden, 
   lisp_maiden-networking, lisp_maiden-serialize,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_maiden-networking lisp_maiden-serialize  ];
      inherit stdenv;
      systemName = "maiden-relay";
      
      sourceProject = "${lisp-project_maiden}";
      patches = [];
      lisp_dependencies = "${lisp_maiden-networking} ${lisp_maiden-serialize}";
      name = "lisp_maiden-relay-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
