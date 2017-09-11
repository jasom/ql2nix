
{ buildLispPackage, stdenv, fetchurl, lisp-project_metafs, 
   lisp_sclf,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_sclf  ];
      inherit stdenv;
      systemName = "metafs";
      
      sourceProject = "${lisp-project_metafs}";
      patches = [];
      lisp_dependencies = "${lisp_sclf}";
      name = "lisp_metafs-20120909-http";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
