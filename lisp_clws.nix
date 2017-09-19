
{ buildLispPackage, stdenv, fetchurl, lisp-project_clws, 
   lisp_flexi-streams, lisp_cl-base64, lisp_chunga, lisp_ironclad, lisp_chanl, lisp_iolib,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_flexi-streams lisp_cl-base64 lisp_chunga lisp_ironclad lisp_chanl lisp_iolib  ];
      inherit stdenv;
      systemName = "clws";
      
      sourceProject = "${lisp-project_clws}";
      patches = [];
      lisp_dependencies = "${lisp_flexi-streams} ${lisp_cl-base64} ${lisp_chunga} ${lisp_ironclad} ${lisp_chanl} ${lisp_iolib}";
      name = "lisp_clws-20130813-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
