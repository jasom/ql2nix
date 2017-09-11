
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-scrobbler, 
   lisp_arnesi, lisp_cl-store, lisp_drakma, lisp_flexi-streams, lisp_md5, lisp_st-json,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_arnesi lisp_cl-store lisp_drakma lisp_flexi-streams lisp_md5 lisp_st-json  ];
      inherit stdenv;
      systemName = "cl-scrobbler";
      
      sourceProject = "${lisp-project_cl-scrobbler}";
      patches = [];
      lisp_dependencies = "${lisp_arnesi} ${lisp_cl-store} ${lisp_drakma} ${lisp_flexi-streams} ${lisp_md5} ${lisp_st-json}";
      name = "lisp_cl-scrobbler-20111105-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
