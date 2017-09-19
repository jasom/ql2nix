
{ buildLispPackage, stdenv, fetchurl, lisp-project_hu-dwim-uri, 
   lisp_iolib-sockets, lisp_hu-dwim-util, lisp_cl-ppcre, lisp_babel, lisp_hu-dwim-asdf,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_iolib-sockets lisp_hu-dwim-util lisp_cl-ppcre lisp_babel lisp_hu-dwim-asdf  ];
      inherit stdenv;
      systemName = "hu.dwim.uri";
      
      sourceProject = "${lisp-project_hu-dwim-uri}";
      patches = [];
      lisp_dependencies = "${lisp_iolib-sockets} ${lisp_hu-dwim-util} ${lisp_cl-ppcre} ${lisp_babel} ${lisp_hu-dwim-asdf}";
      name = "lisp_hu-dwim-uri-20170630-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
