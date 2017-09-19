
{ buildLispPackage, stdenv, fetchurl, lisp-project_dexador, 
   lisp_cl-ssl, lisp_cl-reexport, lisp_cl-base64, lisp_chipz, lisp_trivial-mimes, lisp_cl-cookie, lisp_cl-ppcre, lisp_chunga, lisp_fast-io, lisp_quri, lisp_fast-http, lisp_usocket,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ssl lisp_cl-reexport lisp_cl-base64 lisp_chipz lisp_trivial-mimes lisp_cl-cookie lisp_cl-ppcre lisp_chunga lisp_fast-io lisp_quri lisp_fast-http lisp_usocket  ];
      inherit stdenv;
      systemName = "dexador";
      
      sourceProject = "${lisp-project_dexador}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ssl} ${lisp_cl-reexport} ${lisp_cl-base64} ${lisp_chipz} ${lisp_trivial-mimes} ${lisp_cl-cookie} ${lisp_cl-ppcre} ${lisp_chunga} ${lisp_fast-io} ${lisp_quri} ${lisp_fast-http} ${lisp_usocket}";
      name = "lisp_dexador-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
