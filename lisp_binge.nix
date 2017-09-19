
{ buildLispPackage, stdenv, fetchurl, lisp-project_binge, 
   lisp_sclf, lisp_npg,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_sclf lisp_npg  ];
      inherit stdenv;
      systemName = "binge";
      
      sourceProject = "${lisp-project_binge}";
      patches = [];
      lisp_dependencies = "${lisp_sclf} ${lisp_npg}";
      name = "lisp_binge-20150207T212203";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
