
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-mw, 
   lisp_cl-ppcre, lisp_iolib, lisp_hu-dwim-serializer,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_iolib lisp_hu-dwim-serializer  ];
      inherit stdenv;
      systemName = "cl-mw.examples.ping";
      
      sourceProject = "${lisp-project_cl-mw}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_iolib} ${lisp_hu-dwim-serializer}";
      name = "lisp_cl-mw-examples-ping-20150407-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
