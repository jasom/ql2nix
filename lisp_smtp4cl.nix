
{ buildLispPackage, stdenv, fetchurl, lisp-project_smtp4cl, 
   lisp_mime4cl, lisp_net4cl,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_mime4cl lisp_net4cl  ];
      inherit stdenv;
      systemName = "smtp4cl";
      
      sourceProject = "${lisp-project_smtp4cl}";
      patches = [];
      lisp_dependencies = "${lisp_mime4cl} ${lisp_net4cl}";
      name = "lisp_smtp4cl-20150207T212034";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
