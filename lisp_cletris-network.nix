
{ buildLispPackage, stdenv, fetchurl, lisp-project_cletris, 
   lisp_cl-log, lisp_usocket, lisp_cl-ppcre, lisp_pal,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-log lisp_usocket lisp_cl-ppcre lisp_pal  ];
      inherit stdenv;
      systemName = "cletris-network";
      
      sourceProject = "${lisp-project_cletris}";
      patches = [];
      lisp_dependencies = "${lisp_cl-log} ${lisp_usocket} ${lisp_cl-ppcre} ${lisp_pal}";
      name = "lisp_cletris-network-20151031-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
