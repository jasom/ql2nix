
{ buildLispPackage, stdenv, fetchurl, lisp-project_maiden, 
   lisp_maiden, lisp_usocket,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_maiden lisp_usocket  ];
      inherit stdenv;
      systemName = "maiden-networking";
      
      sourceProject = "${lisp-project_maiden}";
      patches = [];
      lisp_dependencies = "${lisp_maiden} ${lisp_usocket}";
      name = "lisp_maiden-networking-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
