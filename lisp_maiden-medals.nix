
{ buildLispPackage, stdenv, fetchurl, lisp-project_maiden, 
   lisp_ubiquitous-concurrent, lisp_pathname-utils, lisp_uuid, lisp_trivial-garbage, lisp_verbose, lisp_deeds, lisp_lambda-fiddle,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_ubiquitous-concurrent lisp_pathname-utils lisp_uuid lisp_trivial-garbage lisp_verbose lisp_deeds lisp_lambda-fiddle  ];
      inherit stdenv;
      systemName = "maiden-medals";
      
      sourceProject = "${lisp-project_maiden}";
      patches = [];
      lisp_dependencies = "${lisp_ubiquitous-concurrent} ${lisp_pathname-utils} ${lisp_uuid} ${lisp_trivial-garbage} ${lisp_verbose} ${lisp_deeds} ${lisp_lambda-fiddle}";
      name = "lisp_maiden-medals-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
