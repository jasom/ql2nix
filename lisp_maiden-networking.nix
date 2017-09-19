
{ buildLispPackage, stdenv, fetchurl, lisp-project_maiden, 
   lisp_usocket, lisp_uuid, lisp_trivial-garbage, lisp_verbose, lisp_deeds,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_usocket lisp_uuid lisp_trivial-garbage lisp_verbose lisp_deeds  ];
      inherit stdenv;
      systemName = "maiden-networking";
      
      sourceProject = "${lisp-project_maiden}";
      patches = [];
      lisp_dependencies = "${lisp_usocket} ${lisp_uuid} ${lisp_trivial-garbage} ${lisp_verbose} ${lisp_deeds}";
      name = "lisp_maiden-networking-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
