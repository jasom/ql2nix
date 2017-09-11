
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-gravatar, 
   lisp_babel, lisp_cl-json, lisp_drakma, lisp_md5, lisp_puri,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_babel lisp_cl-json lisp_drakma lisp_md5 lisp_puri  ];
      inherit stdenv;
      systemName = "gravatar";
      
      sourceProject = "${lisp-project_cl-gravatar}";
      patches = [];
      lisp_dependencies = "${lisp_babel} ${lisp_cl-json} ${lisp_drakma} ${lisp_md5} ${lisp_puri}";
      name = "lisp_gravatar-20110320-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
