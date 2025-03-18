Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tuW7S-0007n7-Dp
	for mharc-qemu-rust@gnu.org; Tue, 18 Mar 2025 08:32:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tuW7M-0007ld-Gu
 for qemu-rust@nongnu.org; Tue, 18 Mar 2025 08:32:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tuW7I-0005HU-K0
 for qemu-rust@nongnu.org; Tue, 18 Mar 2025 08:32:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742301138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wr+7gBaDG/z6sgTpTjO57+x4a/PzpfCmmpK5TKwcUMc=;
 b=GFgqu3rDXMMW+9uminhV5cImBB3yAqyMbKGiPTn8Ns2Puvn04mdpHNkZFVHsqiUA+RlYB1
 ECQOxH1YJTmjyj2CmlWRY2U/1xn1c7bxHPSukFMNDbXtKIPuG4MSfnVJmHpLeXoEwAovj/
 3VZOIF+tgjZ9qdYUodGcrlerf3xCif0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-GgWRW6fZPgyVEbJ5JaIgKw-1; Tue, 18 Mar 2025 08:32:17 -0400
X-MC-Unique: GgWRW6fZPgyVEbJ5JaIgKw-1
X-Mimecast-MFC-AGG-ID: GgWRW6fZPgyVEbJ5JaIgKw_1742301136
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43947979ce8so16325655e9.0
 for <qemu-rust@nongnu.org>; Tue, 18 Mar 2025 05:32:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742301136; x=1742905936;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wr+7gBaDG/z6sgTpTjO57+x4a/PzpfCmmpK5TKwcUMc=;
 b=C0iwMFs8MyHkFsbzMGD9CmZLc11cjLZK2ALo70k/1e7Tw+hEOtTfsDAqzUd2smHa/W
 Gfxbavbvj7z4T/JJRervnQprY6fugRu/44ZTEW/GKyVjZOenqes1KHQFJYxH8NFZT+8+
 ZVzlaakd81bArXafnh5OolOpcXe6d1HTGkQt4Jp9j4N+Kr6GD5HbuITTO3lFp0F4hp+Y
 kOzpA34QlOV9WH4G6S5xhd2IF2QGEnxa/ogtzZVdp4KJ5EvgqvdS+OkQF9zMjzaNZ6xd
 yBZfQDi0eeWC33L6uRbN7Xx5EawHH4l5oZYivJv1sLFxmP+KoYutcIdQBAAUEvlkOP1O
 +dnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvGjyxIjwn4L8KIt3Rg+LcfddU6to2AQ2/2hFLvhpM7iAuW/rPmB8+gJEecc7SAxpRxxkq0FMiypw=@nongnu.org
X-Gm-Message-State: AOJu0Yxs5e/dC8cwLW/vbXWUdEGQwf0n9DJom7iUmQpdBELehyFUw8f+
 PukGORudi7we9ifQe2sVnimMVJv94unIM72cVwFKtlQW9LXOWUaUMxi/jyjlODAOkPqVOsp25vP
 vrerIziXkINp7UZtQILMnpcpauuOU6SCtiSjdmZERq49ces6hOw/Id8PyID5N+HQsGXRC5elnUA
 D2Xx3Vwba6Lv/s4eW1hzTXe+JnDw==
X-Gm-Gg: ASbGncud643OcTMXGzQQRQ5EaDD9NOUJ3GhCYxmb/caXUGiV5MWJ0gY6rCvpiEOO0B+
 ZV81Am3CK24tNFvw8HJH/2MZ04FDaPejj2gDw1j6+crlyYG0iT8fQD74wKNBAA3NFNbVGvk+sXw
 ==
X-Received: by 2002:a05:6000:4020:b0:390:f902:f973 with SMTP id
 ffacd0b85a97d-3971d13629bmr16007033f8f.8.1742301136019; 
 Tue, 18 Mar 2025 05:32:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+lt3Xh8xB2MNrwzyaE71GNLRqL3ssF0SNufQeH5RY0P6ebktVJJj1NPyGeHsY7Hf05GAkUk9aKmuTPcqx4bs=
X-Received: by 2002:a05:6000:4020:b0:390:f902:f973 with SMTP id
 ffacd0b85a97d-3971d13629bmr16007009f8f.8.1742301135714; Tue, 18 Mar 2025
 05:32:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250318083248.1402990-1-zhao1.liu@intel.com>
 <20250318083248.1402990-11-zhao1.liu@intel.com>
 <9e8743b8-99b2-4aab-84de-7630edcc7e10@redhat.com> <Z9llqtHLLTJIju/j@intel.com>
In-Reply-To: <Z9llqtHLLTJIju/j@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 18 Mar 2025 13:32:03 +0100
X-Gm-Features: AQ5f1JqHD_LxYAa0Aa1NpQQA_Dm7HePd9y2vbWi0LriGt5pOesEPQmTR0qBI-QQ
Message-ID: <CABgObfY1x1s_NOmjeNUjNCz5WggARCH_AUzxC81d+smq=jBf=g@mail.gmail.com>
Subject: Re: [PATCH v2 10/14] rust/vmstate: Support vmstate_validate
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-rust@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mg7o8aOWjrzHSaMOENvIWQ3nJ79H1-oCBUj6QcnL8RM_1742301136
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000004959ba06309d184a"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.332,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 18 Mar 2025 12:32:26 -0000

--0000000000004959ba06309d184a
Content-Type: text/plain; charset="UTF-8"

Il mar 18 mar 2025, 13:03 Zhao Liu <zhao1.liu@intel.com> ha scritto:

> >  /// This macro can be used (by just passing it a type) to forward the
> `VMState`
> > @@ -572,9 +548,9 @@ const fn phantom__<T>(_: &T) ->
> ::core::marker::PhantomData<T> {
> >                  }
> >                  Some(test_cb_builder__::<$struct_name,
> _>(phantom__(&$test_fn)))
> >              },
>
> I want to keep the comment here as C version did, because there's an array
> flag
>

Ok, let's add it. No need to send v3 since it's just a single patch and
with no changes further down.

Paolo

// Though VMS_ARRAY is set, the num is 0: no data, only run test_fn callback
>
> > +            flags: VMStateFlags(VMStateFlags::VMS_MUST_EXIST.0 |
> VMStateFlags::VMS_ARRAY.0),
> >              ..$crate::zeroable::Zeroable::ZERO
> >          }
> > -        .with_validate_flag()
> >      };
> >  }
> >
> > Otherwise the series looks great, thanks!
>
> Let me refresh the v3. :-)
>
> Thanks,
> Zhao
>
>

--0000000000004959ba06309d184a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">Il mar 18 mar 2025, 13:03 Zhao L=
iu &lt;<a href=3D"mailto:zhao1.liu@intel.com">zhao1.liu@intel.com</a>&gt; h=
a scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt;=
=C2=A0 /// This macro can be used (by just passing it a type) to forward th=
e `VMState`<br>
&gt; @@ -572,9 +548,9 @@ const fn phantom__&lt;T&gt;(_: &amp;T) -&gt; ::cor=
e::marker::PhantomData&lt;T&gt; {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Some(tes=
t_cb_builder__::&lt;$struct_name, _&gt;(phantom__(&amp;$test_fn)))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
<br>
I want to keep the comment here as C version did, because there&#39;s an ar=
ray flag<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Ok, let&#39;s add it. No need to send v3 since it&#39;s just a si=
ngle patch and with no changes further down.</div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">Paolo</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o"><div class=3D"gmail_quote gmail_quote_container"><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
// Though VMS_ARRAY is set, the num is 0: no data, only run test_fn callbac=
k<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 flags: VMStateFlags(VMState=
Flags::VMS_MUST_EXIST.0 | VMStateFlags::VMS_ARRAY.0),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ..$crate::zeroable::Ze=
roable::ZERO<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 .with_validate_flag()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 };<br>
&gt;=C2=A0 }<br>
&gt; <br>
&gt; Otherwise the series looks great, thanks!<br>
<br>
Let me refresh the v3. :-)<br>
<br>
Thanks,<br>
Zhao<br>
<br>
</blockquote></div></div></div>

--0000000000004959ba06309d184a--


