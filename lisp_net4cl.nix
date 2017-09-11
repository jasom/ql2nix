
{ buildLispPackage, stdenv, fetchurl, lisp-project_net4cl, 
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
      systemName = "net4cl";
      
      sourceProject = "${lisp-project_net4cl}";
      patches = [];
      lisp_dependencies = "${lisp_sclf}";
      name = "lisp_net4cl-20150207T212000";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
