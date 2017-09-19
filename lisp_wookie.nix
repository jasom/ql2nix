
{ buildLispPackage, stdenv, fetchurl, lisp-project_wookie, 
  openssl,   lisp_cl-fad, lisp_do-urlencode, lisp_quri, lisp_fast-http, lisp_chunga, lisp_cl-async, lisp_blackbird, lisp_alexandria,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-fad lisp_do-urlencode lisp_quri lisp_fast-http lisp_chunga lisp_cl-async lisp_blackbird lisp_alexandria openssl ];
      inherit stdenv;
      systemName = "wookie";
      
      sourceProject = "${lisp-project_wookie}";
      patches = [];
      lisp_dependencies = "${lisp_cl-fad} ${lisp_do-urlencode} ${lisp_quri} ${lisp_fast-http} ${lisp_chunga} ${lisp_cl-async} ${lisp_blackbird} ${lisp_alexandria}";
      name = "lisp_wookie-20170227-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
