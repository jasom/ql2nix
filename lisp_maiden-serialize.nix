
{ buildLispPackage, stdenv, fetchurl, lisp-project_maiden, 
   lisp_gzip-stream, lisp_cl-store, lisp_uuid, lisp_trivial-garbage, lisp_verbose, lisp_deeds,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_gzip-stream lisp_cl-store lisp_uuid lisp_trivial-garbage lisp_verbose lisp_deeds  ];
      inherit stdenv;
      systemName = "maiden-serialize";
      
      sourceProject = "${lisp-project_maiden}";
      patches = [];
      lisp_dependencies = "${lisp_gzip-stream} ${lisp_cl-store} ${lisp_uuid} ${lisp_trivial-garbage} ${lisp_verbose} ${lisp_deeds}";
      name = "lisp_maiden-serialize-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
