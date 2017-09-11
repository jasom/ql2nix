
{ buildLispPackage, stdenv, fetchurl, lisp-project_mime4cl, 
   lisp_npg, lisp_sclf,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_npg lisp_sclf  ];
      inherit stdenv;
      systemName = "mime4cl";
      
      sourceProject = "${lisp-project_mime4cl}";
      patches = [];
      lisp_dependencies = "${lisp_npg} ${lisp_sclf}";
      name = "lisp_mime4cl-20150207T211851";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
