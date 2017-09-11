
{ buildLispPackage, stdenv, fetchurl, lisp-project_mime4cl, 
   lisp_mime4cl,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_mime4cl  ];
      inherit stdenv;
      systemName = "mime4cl-tests";
      
      sourceProject = "${lisp-project_mime4cl}";
      patches = [];
      lisp_dependencies = "${lisp_mime4cl}";
      name = "lisp_mime4cl-tests-20150207T211851";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
