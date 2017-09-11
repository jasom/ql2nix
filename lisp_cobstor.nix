
{ buildLispPackage, stdenv, fetchurl, lisp-project_cobstor, 
   lisp_net4cl, lisp_npg, lisp_sclf,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_net4cl lisp_npg lisp_sclf  ];
      inherit stdenv;
      systemName = "cobstor";
      
      sourceProject = "${lisp-project_cobstor}";
      patches = [];
      lisp_dependencies = "${lisp_net4cl} ${lisp_npg} ${lisp_sclf}";
      name = "lisp_cobstor-20150207T212348";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
