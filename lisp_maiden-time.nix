
{ buildLispPackage, stdenv, fetchurl, lisp-project_maiden, 
   lisp_maiden-api-access, lisp_maiden-client-entities, lisp_maiden-commands, lisp_maiden-location,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_maiden-api-access lisp_maiden-client-entities lisp_maiden-commands lisp_maiden-location  ];
      inherit stdenv;
      systemName = "maiden-time";
      
      sourceProject = "${lisp-project_maiden}";
      patches = [];
      lisp_dependencies = "${lisp_maiden-api-access} ${lisp_maiden-client-entities} ${lisp_maiden-commands} ${lisp_maiden-location}";
      name = "lisp_maiden-time-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
