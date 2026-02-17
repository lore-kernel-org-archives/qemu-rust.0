Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95861E68142
	for <qemu-rust@archiver.kernel.org>; Tue, 17 Feb 2026 08:11:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vsGAh-0004Ko-IB; Tue, 17 Feb 2026 03:11:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vsGAe-0004K4-OQ
 for qemu-rust@nongnu.org; Tue, 17 Feb 2026 03:11:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vsGAa-0007vx-KJ
 for qemu-rust@nongnu.org; Tue, 17 Feb 2026 03:10:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1771315854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W/Uo1E2dvgODleIPWmMm3wQNyuE6fpc4NHRDCY16G/w=;
 b=FVlg4uhGApyXXwUJsuQKfSq3ByMFSgmfmMAgis4Ztp/8gPOmLbeRSPOMY4LqQt9dM7VU9I
 MYIjdJMFC2Km9FTzUsCR20B/I1IDhUXawFtp2GtpuzW6eTz/TbLl3C0SP1PbNi5RzNtQtP
 6d0VyYkmOAepd6yHIk0vO3orty470bQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-482-P1qX7J6hN6yYEy-fDUhIbA-1; Tue, 17 Feb 2026 03:10:52 -0500
X-MC-Unique: P1qX7J6hN6yYEy-fDUhIbA-1
X-Mimecast-MFC-AGG-ID: P1qX7J6hN6yYEy-fDUhIbA_1771315851
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-4376e25bb4dso4223896f8f.0
 for <qemu-rust@nongnu.org>; Tue, 17 Feb 2026 00:10:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771315851; x=1771920651;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W/Uo1E2dvgODleIPWmMm3wQNyuE6fpc4NHRDCY16G/w=;
 b=sTayd72b2WQLIaYxuIL8Vj8C6+1ZwpHgbYfheqPvAxsa352iyjd55yjH/J5XenDMyh
 FmJFoETD0hjbZok+cbjtqp+oPvZz0xUZChA44WzBC8M02d1Msc9kT5J+UhPbUY7NUOmM
 Te7f7DhSMianuEa78bUytAhsjMC2CqHPcN3uiW7YU8AONqvEIGY67gKwZn7fMjob5MuW
 nlDatnH2OXYkz+rE5B6keQZ7k/y4GmJFloDi7t+vSzuwI72VixeaxV5qfA71mt1weLpQ
 bPa/hZhYS9r8VHOjhFZytg9mfLLIF18b0eU+9zcaEMo1kgSwNwmmWCky6/QlDOx7vuBe
 jbsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXg6pV+KtNSfPU+nSqTFzG8N9RD336gG2LXVA9daWQYdhyWJEQoJoCXXig6uLcusC7vMcaDpF82sag=@nongnu.org
X-Gm-Message-State: AOJu0YyVtow6L6qPL1JsaK71tZQucSH39ERVWb6wbK5HIwopwk1+tv8Z
 OSwWcPp0VM1T3QjbyXGhrTZBgw94i3Po1OKkfqTT0TtR2HGECUzqxwpRKFaDDQCNLF+WF7Cw7BH
 8x74y1+vyJjlpsspG5LXJ+IDR/DocYkTzBNYP27noq+DoLvgE0MUToOa7N4fhIxRXiG8jNVoiIU
 ApIXLzc8TSrvAp/DCY65qNApNgh8wECA==
X-Gm-Gg: AZuq6aJMi9Fy0L7J8fqegykq8Yy8M8aw2NhQ4bJ2Zlf82xjUe8X5lsaf9UdchurnEFN
 QNgFvFUz2Hjv15tndVX5RJ3mtfgvV94leoqKkZaOYCclYJgHISDH92jzoHOCnHShka7OCO47Xnz
 yvoyxVd8Hrs9pWuBL2Ujr5DgE2fLZYV56dauBGQQvSSZQk5PDYfgBX/f/NJjDcnXK8tYWC4oY07
 2FUHYkhicErcUHGvMzEP5WWWw37GKKQwwMnIC6BjtmdfpF52KsdiHyqkVmVjwJgiVLwyqmpsagg
 mpYW/KM=
X-Received: by 2002:a05:6000:2901:b0:437:8941:2f7b with SMTP id
 ffacd0b85a97d-43796ac2122mr25696929f8f.19.1771315850922; 
 Tue, 17 Feb 2026 00:10:50 -0800 (PST)
X-Received: by 2002:a05:6000:2901:b0:437:8941:2f7b with SMTP id
 ffacd0b85a97d-43796ac2122mr25696879f8f.19.1771315850403; Tue, 17 Feb 2026
 00:10:50 -0800 (PST)
MIME-Version: 1.0
References: <20260108131043.490084-1-pbonzini@redhat.com>
In-Reply-To: <20260108131043.490084-1-pbonzini@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 17 Feb 2026 09:10:40 +0100
X-Gm-Features: AaiRm51fVtbfMa94EpJi178a0cY3PvFqqtH1n_rBm29JZygzxWrSgyfs_T4FTX0
Message-ID: <CABgObfYhrxjW_TCNaxQkEvkN8trcYjkVz=tCQTO2pGQh6cvDHA@mail.gmail.com>
Subject: Re: [PATCH v2 00/16] rust: QObject and QAPI bindings
To: qemu-devel <qemu-devel@nongnu.org>
Cc: "Armbruster, Markus" <armbru@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 "open list:Rust-related patc..." <qemu-rust@nongnu.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Sip2bwQXKp6fUksulbtsAiaLl2zXUOMJ19rczGjzIEA_1771315851
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000000c78b0064b009c4d"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-rust@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: QEMU Rust-related patches and discussion <qemu-rust.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-rust>
List-Post: <mailto:qemu-rust@nongnu.org>
List-Help: <mailto:qemu-rust-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=subscribe>
Errors-To: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org
Sender: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org

--0000000000000c78b0064b009c4d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It's been more than a month... Looking for reviews of the qapi-gen changes,
especially the non-Rust-specific parts.

Paolo

Il gio 8 gen 2026, 14:10 Paolo Bonzini <pbonzini@redhat.com> ha scritto:

> This adds two related parts of the Rust bindings:
>
> - QAPI code generator that creates Rust structs from the JSON
>   description.  The structs are *not* ABI compatible with the
>   C ones, instead they use native Rust data types.
>
> - QObject bindings and (de)serialization support, which can be used to
>   convert QObjects to and from QAPI structs.
>
> Unfortunately Rust code is not able to use visitors, other than by
> creating an intermediate QObject.  This is because of the different
> architecture of serde vs. QAPI visitors, and because visitor's
> dual-purpose functions, where the same function is used by both input and
> output visitors, rely heavily on the structs using the same representatio=
n
> as the visitor arguments (for example NUL-terminated strings).
>
> The serde format implementation was co-authored by me and Marc-Andr=C3=A9=
.
> Marc-Andr=C3=A9 did all the bug fixing and integration testing.
>
> As an example of how this would be used, the marshaling functions for
> QMP commands would look like this:
>
> fn qmp_marshal_query_stats(args: *mut QDict,
>     retp: *mut *mut QObject, errp: *mut *mut Error)
> {
>     let qobj =3D unsafe { QObject::cloned_from_raw(args.cast()) };
>
>     let result =3D from_qobject::<StatsFilter>(qobj)
>          .map_err(anyhow::Error::from)
>          .and_then(qmp_query_stats)
>          .and_then(|ret|
> to_qobject::<Vec<StatsResult>>(ret).map_err(anyhow::Error::from));
>
>     match qmp_marshal_query_stats_rs(qobj) {
>         Ok(ret) =3D> unsafe { *retp =3D ret.into_raw(); },
>         Err(e) =3D> unsafe { crate::Error::from(e).propagate(errp) },
>     }
> }
>
> Despite the long v1->v2, the changes are mostly cosmetic; there are a few
> small differences in the detection of types to be wrapped with Box<>,
> because Vec<> is now considered to break cycles.
>
> Available at branch rust-next of https://gitlab.com/bonzini/qemu (which
> is now almost empty other than this series, yay).
>
> Paolo
>
> v1->v2, Rust:
> - adjust comments in C code (include/qobject/qobject.h)
> - improve or fix documentation in rust/util/src/qobject/mod.rs
> - introduce a qobject! macro that is equivalent to QOBJECT()
> - remark when functions are converted from C inlines
> - rename from_int/from_uint/from_double macros
> - fix incorrect "native: true" on serde and serde_core overrides
> - rebase
>
> qapi-gen:
> - rewrite QAPISchemaIfCond.rsgen() to avoid messy typing
> - new patches 10-11 to extend existing qapigen code
> - rewritten rs_type() to avoid going through a C type first
> - removed renaming of QAPICBackend
> - reused C functions for case conversions
> - clean up rs_name, move it to common.py (needed for rs_type() changes)
> - Vec<> can break cycles and avoid boxing of structs
> - restrict squashing of consecutive newlines to Rust code
> - add copyright blurb
> - annotate that using a separate qapi-gen backend is temporary
> - drop #[derive(common::TryInto)] from enums
>
> Marc-Andr=C3=A9 Lureau (7):
>   rust/qobject: add Display/Debug
>   scripts/qapi: add QAPISchemaIfCond.rsgen()
>   scripts/qapi: generate high-level Rust bindings
>   scripts/rustc_args: add --no-strict-cfg
>   rust/util: build QAPI types
>   scripts/qapi: add serde attributes
>   rust/tests: QAPI integration tests
>
> Paolo Bonzini (9):
>   rust/qobject: add basic bindings
>   subprojects: add serde
>   rust/qobject: add Serialize implementation
>   rust/qobject: add Serializer (to_qobject) implementation
>   rust/qobject: add Deserialize implementation
>   rust/qobject: add Deserializer (from_qobject) implementation
>   rust/qobject: add from/to JSON bindings for QObject
>   scripts/qapi: add QAPISchemaType.is_predefined
>   scripts/qapi: pull c_name from camel_to_upper to caller
>
>  docs/devel/rust.rst                           |   1 +
>  meson.build                                   |   4 +-
>  include/qobject/qobject.h                     |   5 +-
>  rust/util/wrapper.h                           |   8 +
>  qapi/meson.build                              |   9 +
>  rust/Cargo.lock                               |   2 +
>  rust/Cargo.toml                               |   2 +
>  rust/meson.build                              |   4 +
>  rust/tests/meson.build                        |  21 +-
>  rust/tests/tests/integration.rs               |   2 +
>  rust/tests/tests/qapi.rs                      | 444 +++++++++++++
>  rust/util/Cargo.toml                          |   2 +
>  rust/util/meson.build                         |  30 +-
>  rust/util/src/lib.rs                          |   4 +
>  rust/util/src/qobject/deserialize.rs          | 134 ++++
>  rust/util/src/qobject/deserializer.rs         | 371 +++++++++++
>  rust/util/src/qobject/error.rs                |  58 ++
>  rust/util/src/qobject/mod.rs                  | 383 ++++++++++++
>  rust/util/src/qobject/serialize.rs            |  59 ++
>  rust/util/src/qobject/serializer.rs           | 585 ++++++++++++++++++
>  scripts/archive-source.sh                     |   3 +
>  scripts/make-release                          |   2 +-
>  scripts/qapi/backend.py                       |  25 +
>  scripts/qapi/common.py                        |  66 +-
>  scripts/qapi/rs.py                            |  61 ++
>  scripts/qapi/rs_types.py                      | 394 ++++++++++++
>  scripts/qapi/schema.py                        |  74 ++-
>  scripts/rust/rustc_args.py                    |  16 +-
>  subprojects/.gitignore                        |   3 +
>  .../packagefiles/serde-1-rs/meson.build       |  36 ++
>  .../packagefiles/serde-1.0.226-include.patch  |  16 +
>  .../packagefiles/serde_core-1-rs/meson.build  |  25 +
>  .../serde_core-1.0.226-include.patch          |  15 +
>  .../serde_derive-1-rs/meson.build             |  35 ++
>  .../serde_derive-1.0.226-include.patch        |  11 +
>  subprojects/serde-1-rs.wrap                   |  11 +
>  subprojects/serde_core-1-rs.wrap              |  11 +
>  subprojects/serde_derive-1-rs.wrap            |  11 +
>  38 files changed, 2910 insertions(+), 33 deletions(-)
>  create mode 100644 rust/tests/tests/integration.rs
>  create mode 100644 rust/tests/tests/qapi.rs
>  create mode 100644 rust/util/src/qobject/deserialize.rs
>  create mode 100644 rust/util/src/qobject/deserializer.rs
>  create mode 100644 rust/util/src/qobject/error.rs
>  create mode 100644 rust/util/src/qobject/mod.rs
>  create mode 100644 rust/util/src/qobject/serialize.rs
>  create mode 100644 rust/util/src/qobject/serializer.rs
>  create mode 100644 scripts/qapi/rs.py
>  create mode 100644 scripts/qapi/rs_types.py
>  create mode 100644 subprojects/packagefiles/serde-1-rs/meson.build
>  create mode 100644 subprojects/packagefiles/serde-1.0.226-include.patch
>  create mode 100644 subprojects/packagefiles/serde_core-1-rs/meson.build
>  create mode 100644
> subprojects/packagefiles/serde_core-1.0.226-include.patch
>  create mode 100644 subprojects/packagefiles/serde_derive-1-rs/meson.buil=
d
>  create mode 100644
> subprojects/packagefiles/serde_derive-1.0.226-include.patch
>  create mode 100644 subprojects/serde-1-rs.wrap
>  create mode 100644 subprojects/serde_core-1-rs.wrap
>  create mode 100644 subprojects/serde_derive-1-rs.wrap
>
> --
> 2.52.0
>

--0000000000000c78b0064b009c4d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">It&#39;s been more than a month... Looking for reviews of=
 the qapi-gen changes, especially the non-Rust-specific parts.<div dir=3D"a=
uto"><br></div><div dir=3D"auto">Paolo</div></div><br><div class=3D"gmail_q=
uote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Il gio 8 =
gen 2026, 14:10 Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pb=
onzini@redhat.com</a>&gt; ha scritto:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">This adds two related parts of the Rust bindings:<br>
<br>
- QAPI code generator that creates Rust structs from the JSON<br>
=C2=A0 description.=C2=A0 The structs are *not* ABI compatible with the<br>
=C2=A0 C ones, instead they use native Rust data types.<br>
<br>
- QObject bindings and (de)serialization support, which can be used to<br>
=C2=A0 convert QObjects to and from QAPI structs.<br>
<br>
Unfortunately Rust code is not able to use visitors, other than by<br>
creating an intermediate QObject.=C2=A0 This is because of the different<br=
>
architecture of serde vs. QAPI visitors, and because visitor&#39;s<br>
dual-purpose functions, where the same function is used by both input and<b=
r>
output visitors, rely heavily on the structs using the same representation<=
br>
as the visitor arguments (for example NUL-terminated strings).<br>
<br>
The serde format implementation was co-authored by me and Marc-Andr=C3=A9.<=
br>
Marc-Andr=C3=A9 did all the bug fixing and integration testing.<br>
<br>
As an example of how this would be used, the marshaling functions for<br>
QMP commands would look like this:<br>
<br>
fn qmp_marshal_query_stats(args: *mut QDict,<br>
=C2=A0 =C2=A0 retp: *mut *mut QObject, errp: *mut *mut Error)<br>
{<br>
=C2=A0 =C2=A0 let qobj =3D unsafe { QObject::cloned_from_raw(args.cast()) }=
;<br>
<br>
=C2=A0 =C2=A0 let result =3D from_qobject::&lt;StatsFilter&gt;(qobj)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.map_err(anyhow::Error::from)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.and_then(qmp_query_stats)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.and_then(|ret| to_qobject::&lt;Vec&lt;St=
atsResult&gt;&gt;(ret).map_err(anyhow::Error::from));<br>
<br>
=C2=A0 =C2=A0 match qmp_marshal_query_stats_rs(qobj) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Ok(ret) =3D&gt; unsafe { *retp =3D ret.into_raw=
(); },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Err(e) =3D&gt; unsafe { crate::Error::from(e).p=
ropagate(errp) },<br>
=C2=A0 =C2=A0 }<br>
}<br>
<br>
Despite the long v1-&gt;v2, the changes are mostly cosmetic; there are a fe=
w<br>
small differences in the detection of types to be wrapped with Box&lt;&gt;,=
<br>
because Vec&lt;&gt; is now considered to break cycles.<br>
<br>
Available at branch rust-next of <a href=3D"https://gitlab.com/bonzini/qemu=
" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gitlab.com/bonzin=
i/qemu</a> (which<br>
is now almost empty other than this series, yay).<br>
<br>
Paolo<br>
<br>
v1-&gt;v2, Rust:<br>
- adjust comments in C code (include/qobject/qobject.h)<br>
- improve or fix documentation in rust/util/src/qobject/mod.rs<br>
- introduce a qobject! macro that is equivalent to QOBJECT()<br>
- remark when functions are converted from C inlines<br>
- rename from_int/from_uint/from_double macros<br>
- fix incorrect &quot;native: true&quot; on serde and serde_core overrides<=
br>
- rebase<br>
<br>
qapi-gen:<br>
- rewrite QAPISchemaIfCond.rsgen() to avoid messy typing<br>
- new patches 10-11 to extend existing qapigen code<br>
- rewritten rs_type() to avoid going through a C type first<br>
- removed renaming of QAPICBackend<br>
- reused C functions for case conversions<br>
- clean up rs_name, move it to common.py (needed for rs_type() changes)<br>
- Vec&lt;&gt; can break cycles and avoid boxing of structs<br>
- restrict squashing of consecutive newlines to Rust code<br>
- add copyright blurb<br>
- annotate that using a separate qapi-gen backend is temporary<br>
- drop #[derive(common::TryInto)] from enums<br>
<br>
Marc-Andr=C3=A9 Lureau (7):<br>
=C2=A0 rust/qobject: add Display/Debug<br>
=C2=A0 scripts/qapi: add QAPISchemaIfCond.rsgen()<br>
=C2=A0 scripts/qapi: generate high-level Rust bindings<br>
=C2=A0 scripts/rustc_args: add --no-strict-cfg<br>
=C2=A0 rust/util: build QAPI types<br>
=C2=A0 scripts/qapi: add serde attributes<br>
=C2=A0 rust/tests: QAPI integration tests<br>
<br>
Paolo Bonzini (9):<br>
=C2=A0 rust/qobject: add basic bindings<br>
=C2=A0 subprojects: add serde<br>
=C2=A0 rust/qobject: add Serialize implementation<br>
=C2=A0 rust/qobject: add Serializer (to_qobject) implementation<br>
=C2=A0 rust/qobject: add Deserialize implementation<br>
=C2=A0 rust/qobject: add Deserializer (from_qobject) implementation<br>
=C2=A0 rust/qobject: add from/to JSON bindings for QObject<br>
=C2=A0 scripts/qapi: add QAPISchemaType.is_predefined<br>
=C2=A0 scripts/qapi: pull c_name from camel_to_upper to caller<br>
<br>
=C2=A0docs/devel/rust.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A04 +-<br>
=C2=A0include/qobject/qobject.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A05 +-<br>
=C2=A0rust/util/wrapper.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A08 +<br>
=C2=A0qapi/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A09 +<br>
=C2=A0rust/Cargo.lock=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 =
+<br>
=C2=A0rust/Cargo.toml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 =
+<br>
=C2=A0rust/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +<br>
=C2=A0rust/tests/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 21 +-<br>
=C2=A0rust/tests/tests/integration.rs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0rust/tests/tests/qapi.rs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 444 +++++++++++++<br>
=C2=A0rust/util/Cargo.toml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0rust/util/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 30 +-<br>
=C2=A0rust/util/src/lib.rs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +<br>
=C2=A0rust/util/src/qobject/deserialize.rs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 134 ++++<br>
=C2=A0rust/util/src/qobject/deserializer.rs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 371 +++++++++++<br>
=C2=A0rust/util/src/qobject/error.rs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 58 ++<br>
=C2=A0rust/util/src/qobject/mod.rs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | 383 ++++++++++++<br>
=C2=A0rust/util/src/qobject/serialize.rs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 59 ++<br>
=C2=A0rust/util/src/qobject/serializer.rs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 585 ++++++++++++++++++<br>
=C2=A0scripts/archive-source.sh=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
=C2=A0scripts/make-release=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0scripts/qapi/backend.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 25 +<br>
=C2=A0scripts/qapi/common.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 66 +-<br>
=C2=A0scripts/qapi/rs.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 61 ++<br>
=C2=A0scripts/qapi/rs_types.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 394 ++++++++++++<br>
=C2=A0scripts/qapi/schema.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 74 ++-<br>
=C2=A0scripts/rust/rustc_args.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 16 +-<br>
=C2=A0subprojects/.gitignore=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 +<br>
=C2=A0.../packagefiles/serde-1-rs/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 36 ++<br>
=C2=A0.../packagefiles/serde-1.0.226-include.patch=C2=A0 |=C2=A0 16 +<br>
=C2=A0.../packagefiles/serde_core-1-rs/meson.build=C2=A0 |=C2=A0 25 +<br>
=C2=A0.../serde_core-1.0.226-include.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 15 +<br>
=C2=A0.../serde_derive-1-rs/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 35 ++<br>
=C2=A0.../serde_derive-1.0.226-include.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 11 +<br>
=C2=A0subprojects/serde-1-rs.wrap=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 11 +<br>
=C2=A0subprojects/serde_core-1-rs.wrap=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 11 +<br>
=C2=A0subprojects/serde_derive-1-rs.wrap=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 11 +<br>
=C2=A038 files changed, 2910 insertions(+), 33 deletions(-)<br>
=C2=A0create mode 100644 rust/tests/tests/integration.rs<br>
=C2=A0create mode 100644 rust/tests/tests/qapi.rs<br>
=C2=A0create mode 100644 rust/util/src/qobject/deserialize.rs<br>
=C2=A0create mode 100644 rust/util/src/qobject/deserializer.rs<br>
=C2=A0create mode 100644 rust/util/src/qobject/error.rs<br>
=C2=A0create mode 100644 rust/util/src/qobject/mod.rs<br>
=C2=A0create mode 100644 rust/util/src/qobject/serialize.rs<br>
=C2=A0create mode 100644 rust/util/src/qobject/serializer.rs<br>
=C2=A0create mode 100644 scripts/qapi/rs.py<br>
=C2=A0create mode 100644 scripts/qapi/rs_types.py<br>
=C2=A0create mode 100644 subprojects/packagefiles/serde-1-rs/meson.build<br=
>
=C2=A0create mode 100644 subprojects/packagefiles/serde-1.0.226-include.pat=
ch<br>
=C2=A0create mode 100644 subprojects/packagefiles/serde_core-1-rs/meson.bui=
ld<br>
=C2=A0create mode 100644 subprojects/packagefiles/serde_core-1.0.226-includ=
e.patch<br>
=C2=A0create mode 100644 subprojects/packagefiles/serde_derive-1-rs/meson.b=
uild<br>
=C2=A0create mode 100644 subprojects/packagefiles/serde_derive-1.0.226-incl=
ude.patch<br>
=C2=A0create mode 100644 subprojects/serde-1-rs.wrap<br>
=C2=A0create mode 100644 subprojects/serde_core-1-rs.wrap<br>
=C2=A0create mode 100644 subprojects/serde_derive-1-rs.wrap<br>
<br>
-- <br>
2.52.0<br>
</blockquote></div>

--0000000000000c78b0064b009c4d--


