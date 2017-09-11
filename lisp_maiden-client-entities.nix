
{ buildLispPackage, stdenv, fetchurl, lisp-project_maiden, 
   lisp_documentation-utils, lisp_maiden,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_documentation-utils lisp_maiden  ];
      inherit stdenv;
      systemName = "maiden-client-entities";
      
      sourceProject = "${lisp-project_maiden}";
      patches = [];
      lisp_dependencies = "${lisp_documentation-utils} ${lisp_maiden}";
      name = "lisp_maiden-client-entities-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
