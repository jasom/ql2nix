
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-gravatar, 
   lisp_cl-json, lisp_drakma, lisp_md5,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-json lisp_drakma lisp_md5  ];
      inherit stdenv;
      systemName = "gravatar";
      
      sourceProject = "${lisp-project_cl-gravatar}";
      patches = [];
      lisp_dependencies = "${lisp_cl-json} ${lisp_drakma} ${lisp_md5}";
      name = "lisp_gravatar-20110320-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
