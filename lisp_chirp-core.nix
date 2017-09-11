
{ buildLispPackage, stdenv, fetchurl, lisp-project_chirp, 
   lisp_yason, lisp_split-sequence, lisp_uuid, lisp_flexi-streams, lisp_local-time, lisp_cl-base64, lisp_cl-ppcre, lisp_babel,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_yason lisp_split-sequence lisp_uuid lisp_flexi-streams lisp_local-time lisp_cl-base64 lisp_cl-ppcre lisp_babel  ];
      inherit stdenv;
      systemName = "chirp-core";
      
      sourceProject = "${lisp-project_chirp}";
      patches = [];
      lisp_dependencies = "${lisp_yason} ${lisp_split-sequence} ${lisp_uuid} ${lisp_flexi-streams} ${lisp_local-time} ${lisp_cl-base64} ${lisp_cl-ppcre} ${lisp_babel}";
      name = "lisp_chirp-core-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
