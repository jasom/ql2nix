
{ buildLispPackage, stdenv, fetchurl, lisp-project_dexador, 
   lisp_alexandria, lisp_babel, lisp_bordeaux-threads, lisp_chipz, lisp_chunga, lisp_cl-ssl, lisp_cl-base64, lisp_cl-cookie, lisp_cl-ppcre, lisp_cl-reexport, lisp_fast-http, lisp_fast-io, lisp_quri, lisp_trivial-gray-streams, lisp_trivial-mimes, lisp_usocket,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_babel lisp_bordeaux-threads lisp_chipz lisp_chunga lisp_cl-ssl lisp_cl-base64 lisp_cl-cookie lisp_cl-ppcre lisp_cl-reexport lisp_fast-http lisp_fast-io lisp_quri lisp_trivial-gray-streams lisp_trivial-mimes lisp_usocket  ];
      inherit stdenv;
      systemName = "dexador";
      
      sourceProject = "${lisp-project_dexador}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_babel} ${lisp_bordeaux-threads} ${lisp_chipz} ${lisp_chunga} ${lisp_cl-ssl} ${lisp_cl-base64} ${lisp_cl-cookie} ${lisp_cl-ppcre} ${lisp_cl-reexport} ${lisp_fast-http} ${lisp_fast-io} ${lisp_quri} ${lisp_trivial-gray-streams} ${lisp_trivial-mimes} ${lisp_usocket}";
      name = "lisp_dexador-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
