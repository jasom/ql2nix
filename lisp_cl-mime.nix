
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-mime, 
   lisp_cl-base64, lisp_cl-ppcre, lisp_cl-qprint,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-base64 lisp_cl-ppcre lisp_cl-qprint  ];
      inherit stdenv;
      systemName = "cl-mime";
      
      sourceProject = "${lisp-project_cl-mime}";
      patches = [];
      lisp_dependencies = "${lisp_cl-base64} ${lisp_cl-ppcre} ${lisp_cl-qprint}";
      name = "lisp_cl-mime-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
