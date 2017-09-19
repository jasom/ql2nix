
{ buildLispPackage, stdenv, fetchurl, lisp-project_chirp, 
   lisp_dexador, lisp_babel, lisp_cl-ppcre, lisp_cl-base64, lisp_local-time, lisp_flexi-streams, lisp_uuid, lisp_split-sequence, lisp_yason,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_dexador lisp_babel lisp_cl-ppcre lisp_cl-base64 lisp_local-time lisp_flexi-streams lisp_uuid lisp_split-sequence lisp_yason  ];
      inherit stdenv;
      systemName = "chirp-dexador";
      
      sourceProject = "${lisp-project_chirp}";
      patches = [];
      lisp_dependencies = "${lisp_dexador} ${lisp_babel} ${lisp_cl-ppcre} ${lisp_cl-base64} ${lisp_local-time} ${lisp_flexi-streams} ${lisp_uuid} ${lisp_split-sequence} ${lisp_yason}";
      name = "lisp_chirp-dexador-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
