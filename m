Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uIBJD-0002iQ-JL
	for mharc-qemu-rust@gnu.org; Thu, 22 May 2025 15:10:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1uIBJC-0002i9-0E
 for qemu-rust@nongnu.org; Thu, 22 May 2025 15:10:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1uIBJA-0007IF-7C
 for qemu-rust@nongnu.org; Thu, 22 May 2025 15:10:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747941021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7jrCVBNIMsxlyvEWtUS8CwjTNirrbtIxIjRxS5h//O4=;
 b=f8DgugOZueEkKyFqhwCwxjar0euWG9wjkf0VkI5Gdxk0+ZvMa6Stpr0AcC5lSnH+aQYNm3
 V8uwNHkqNgh21m0Y2nB9xkyLcg3pp4L+A8JC3nKTf0XkgvYisLMdodIthFKN6r6GpPNKdt
 DiyYoWo3yAo3StBtIpGJWu7Q+/FZ3ZI=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-580-MAwGwcHrOFyTQte5w1sd7A-1; Thu, 22 May 2025 15:10:19 -0400
X-MC-Unique: MAwGwcHrOFyTQte5w1sd7A-1
X-Mimecast-MFC-AGG-ID: MAwGwcHrOFyTQte5w1sd7A_1747941019
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-23205cb56c0so48601235ad.3
 for <qemu-rust@nongnu.org>; Thu, 22 May 2025 12:10:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747941019; x=1748545819;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7jrCVBNIMsxlyvEWtUS8CwjTNirrbtIxIjRxS5h//O4=;
 b=sbZHjVJm0N8dN+8SDVS7PmKPRlp0c6qdrFhyTpKr5TBUwXgcHylQXmiIzO8RqsPYII
 i/kW/f8mcpa1u4gvX0CkPBprBM1KOHyFoWYHtBIB8gjXCaOk5T0MMSYVMl17Ja5+lmbF
 kiJJ6Ond7QcPh0bmeOr90J7MXMtKhzDO8izoIvkkG+d/e71FwimIoS/IfQ6u+xtRA8ma
 fBL82t46VVgevTeyx84EP1M7s7Tl5U1KSjDa18w2mexyzPzVrwtwaEG9Y/ZPo6kPZ7cI
 G0W554DB5TT0u7S3hwKliPzIURbiARdU4JD8c+gBLCz/FTXg9w4Lo/kgjbyU5EWXl907
 S3eg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7A/H2YgKq8T7nmllBptgmZ+DHPAs/TbFAgIJYxYvluZAhtGUo7GKfPbdil/slycYyouvz5VWWYb4=@nongnu.org
X-Gm-Message-State: AOJu0Yy0ehh7UjhQF3ygvr4F1z+gbBp/pFHGTunB9PHupDpVReIgr4sU
 Z3fdUvQwNH3L74ge3JAdw65T2egqkbD7rGGrY+HcThMCkTtx8VyxV0HI+13Baukf8m9JveUOFmJ
 28K0U63teMKo2xd3MYFrctoNkHEBNSraKjTgg+BVfMlg2/iDla3oXm2GcjoP42L8lCgD0EbABqO
 MTv6hCKa+re95Nm24SOxG3u7YYbWbjgw==
X-Gm-Gg: ASbGncubfq2mNmN9B2wT/bePGV0Qfbb+Ydui4uud5oFGLrqJup3P4LTwLfH0nwJ41qX
 //E8XY8Gy/kLyrHZkgFxt/FMC2N9Lrf12P2pw8CpphL9iOKvC9N5NAp/62WWn3e9nmQkiH0/k2Q
 rS+LXa1vGLsH/QRPDLQVLSKiYa
X-Received: by 2002:a17:903:4b2b:b0:223:f9a4:3f99 with SMTP id
 d9443c01a7336-233f23c5f97mr2168555ad.29.1747941018697; 
 Thu, 22 May 2025 12:10:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1UzYnR5db1NYBaiEsNjkJno06sN5V3LsqShVMV1fnumY8Hg3Xf+6ZlDnmQ0o5GSx5bZPxZSHu+ydMvMb+ovU=
X-Received: by 2002:a17:903:4b2b:b0:223:f9a4:3f99 with SMTP id
 d9443c01a7336-233f23c5f97mr2168155ad.29.1747941018371; Thu, 22 May 2025
 12:10:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250519182153.3835722-1-jsnow@redhat.com>
 <20250519182153.3835722-3-jsnow@redhat.com>
 <875xhvd8zh.fsf@pond.sub.org>
In-Reply-To: <875xhvd8zh.fsf@pond.sub.org>
From: John Snow <jsnow@redhat.com>
Date: Thu, 22 May 2025 15:10:05 -0400
X-Gm-Features: AX0GCFt6IjzYhpMWMo1PyURxrAEJDRNO2M-fHSozQcD3aRJFEdJ4HrJneuQWi38
Message-ID: <CAFn=p-ZaG3F_aBOoMEk2x8X9nCUFjL=CkjMAynUbwyAaJHNSwA@mail.gmail.com>
Subject: Re: [PATCH 2/8] python: update pylint ignores
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Peter Maydell <peter.maydell@linaro.org>, Hanna Reitz <hreitz@redhat.com>, 
 Ani Sinha <anisinha@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>, qemu-block@nongnu.org, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-rust@nongnu.org, 
 Maksim Davydov <davydov-max@yandex-team.ru>, Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Kevin Wolf <kwolf@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: loeCPstOpDyB_mwyBbN-JkoBGpVpqx3JNbG97blMQKU_1747941019
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000007d2d180635be3b94"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.275,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 22 May 2025 19:10:26 -0000

--0000000000007d2d180635be3b94
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 3:42=E2=80=AFAM Markus Armbruster <armbru@redhat.co=
m> wrote:

> John Snow <jsnow@redhat.com> writes:
>
> > The next patch will synchronize the qemu.qmp library with the external,
> > standalone version. That synchronization will require a few extra
> > ignores for pylint, so do that now.
>
> Just one, unless I'm cross-eyed again.
>

Nope. changed the commit message. Just doing things in weird orders as is
my usual...


>
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >  python/setup.cfg | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/python/setup.cfg b/python/setup.cfg
> > index d7f5dc7bafe..02cc076eaea 100644
> > --- a/python/setup.cfg
> > +++ b/python/setup.cfg
> > @@ -140,11 +140,12 @@ ignore_missing_imports =3D True
> >  # --disable=3DW".
> >  disable=3Dconsider-using-f-string,
> >          consider-using-with,
> > +        no-member,  # mypy also handles this better.
> >          too-many-arguments,
> > -        too-many-positional-arguments,
> >          too-many-function-args,  # mypy handles this with less false
> positives.
> >          too-many-instance-attributes,
> > -        no-member,  # mypy also handles this better.
> > +        too-many-positional-arguments,
>
> Up to here, just a reorder, which I appreciate.
>
> > +        unknown-option-value,
>
> This is the new one.
>
> >
> >  [pylint.basic]
> >  # Good variable names which should always be accepted, separated by a
> comma.
>
>

--0000000000007d2d180635be3b94
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, May 20,=
 2025 at 3:42=E2=80=AFAM Markus Armbruster &lt;<a href=3D"mailto:armbru@red=
hat.com">armbru@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">John Snow &lt;<a href=3D"mailto:jsnow@redhat.com"=
 target=3D"_blank">jsnow@redhat.com</a>&gt; writes:<br>
<br>
&gt; The next patch will synchronize the qemu.qmp library with the external=
,<br>
&gt; standalone version. That synchronization will require a few extra<br>
&gt; ignores for pylint, so do that now.<br>
<br>
Just one, unless I&#39;m cross-eyed again.<br></blockquote><div><br></div><=
div>Nope. changed the commit message. Just doing things in weird orders as =
is my usual...</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 python/setup.cfg | 5 +++--<br>
&gt;=C2=A0 1 file changed, 3 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/python/setup.cfg b/python/setup.cfg<br>
&gt; index d7f5dc7bafe..02cc076eaea 100644<br>
&gt; --- a/python/setup.cfg<br>
&gt; +++ b/python/setup.cfg<br>
&gt; @@ -140,11 +140,12 @@ ignore_missing_imports =3D True<br>
&gt;=C2=A0 # --disable=3DW&quot;.<br>
&gt;=C2=A0 disable=3Dconsider-using-f-string,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 consider-using-with,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 no-member,=C2=A0 # mypy also handles this=
 better.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 too-many-arguments,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 too-many-positional-arguments,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 too-many-function-args,=C2=A0 # mypy=
 handles this with less false positives.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 too-many-instance-attributes,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 no-member,=C2=A0 # mypy also handles this=
 better.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 too-many-positional-arguments,<br>
<br>
Up to here, just a reorder, which I appreciate.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 unknown-option-value,<br>
<br>
This is the new one.<br>
<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 [pylint.basic]<br>
&gt;=C2=A0 # Good variable names which should always be accepted, separated=
 by a comma.<br>
<br>
</blockquote></div></div>

--0000000000007d2d180635be3b94--


