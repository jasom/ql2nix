
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-recaptcha, 
   lisp_cl-ppcre, lisp_drakma, lisp_flexi-streams, lisp_jsown,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_drakma lisp_flexi-streams lisp_jsown  ];
      inherit stdenv;
      systemName = "cl-recaptcha";
      
      sourceProject = "${lisp-project_cl-recaptcha}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_drakma} ${lisp_flexi-streams} ${lisp_jsown}";
      name = "lisp_cl-recaptcha-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
