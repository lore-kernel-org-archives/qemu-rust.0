Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tOA4W-0000bk-AV
	for mharc-qemu-rust@gnu.org; Thu, 19 Dec 2024 01:31:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tOA4N-0000b9-BH
 for qemu-rust@nongnu.org; Thu, 19 Dec 2024 01:31:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tOA4K-0008Oh-UR
 for qemu-rust@nongnu.org; Thu, 19 Dec 2024 01:31:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1734589890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jsx8h249WxpVgl/ARc3kRdycQhSKY/AaHGzTtsQ5gNc=;
 b=Xp4x+MNTW2U/aCW5FwiQ5P5l/eYfzTAsQcXE/au4/I6qhD5bRsFBJqwNyIETcHpbfNYEPm
 gY8nEmrkyfyuql+Oegh+5c+zxRDLn1VzSxjHbGqTE/AJNIgpso7GtinP1fpm+EdJIXnIOM
 bW7SAHJsNtN3YJQ96PKi50doFbnuOYs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-396-VDzsn9hJP1a4YBi8Tdj5Mg-1; Thu, 19 Dec 2024 01:31:28 -0500
X-MC-Unique: VDzsn9hJP1a4YBi8Tdj5Mg-1
X-Mimecast-MFC-AGG-ID: VDzsn9hJP1a4YBi8Tdj5Mg
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3862e986d17so205045f8f.3
 for <qemu-rust@nongnu.org>; Wed, 18 Dec 2024 22:31:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734589886; x=1735194686;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jsx8h249WxpVgl/ARc3kRdycQhSKY/AaHGzTtsQ5gNc=;
 b=f9nnj4MqHOVGnq7owyvD3e3uepF7WAEj8rZuaa6G52o90+uD0/xQwEc7LpngJj4BoH
 lvPlX2IF0hFCf9clqPqaWbBmOqMXPbutRr7JSRin+1+zwJif9E3M2KfmStz4wx16MgzN
 3oXAx6UAH4xwqoDBtVr2NaWvPfcHA723dzAnDFZgDm9xH5v2i1X0bwXQvS8rLeqoLBZ+
 KRzH8dLrUR0BGMGn/H6ZSDFVEO6n4Y/0AReJSgKohTf+bUwjC7dxrXKl9a5x3wzGXtfy
 7/wPZoWM0qg3czaiv4aIo3qd+1LqbhB61wa6P/XesicP0EG8H6LjTGhobqOXsenenUTw
 U9Iw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWP81AZt5p4EiMi326zvsJ+GxI/+EDtAf404ZiqcPjuOqxBeYqu0vS/vGZn17EfZ5jNbEKGbjKdWwk=@nongnu.org
X-Gm-Message-State: AOJu0YxkT9eguSwnP5M4S0zHghYxvBuPnvpHgKXN349hiISK3C6oCsAt
 sigSBwVHpCTJiHDrhkmtrhBVG+ErRXDvei/edPkIjQ+5Q5JDZxmFUcmcwcN6GfaDvSKh0YzMJx/
 InRgvgl2AQuXkb6pL/p8venipOFDXq7i8ghM1APofnpZU3ysOGbqosk3BEWIXDHaWjdGuO7hT71
 7qDUW1qgdFf462CVhLq7aQxJodBUKwcKSqQA==
X-Gm-Gg: ASbGncs7wwbSeA3t1v7Kgn+pbdgcqy5CfY+bhEwCLNTKymVWS5uaniPthKB8bn9aV4A
 ocEPXwvLD+DCOJdtUjR55OmdtzmytAQGoD/kN8g==
X-Received: by 2002:a05:6000:79e:b0:385:e055:a28d with SMTP id
 ffacd0b85a97d-388e4db69bamr4223571f8f.57.1734589886577; 
 Wed, 18 Dec 2024 22:31:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFM4sscGNRGV0K+4r/N79UUPlg8jsZycQ2xPTUVzviN35atlEki0drZQzzKUhgvXA7lAvOhpLWkasmC3x4xRnI=
X-Received: by 2002:a05:6000:79e:b0:385:e055:a28d with SMTP id
 ffacd0b85a97d-388e4db69bamr4223558f8f.57.1734589886271; Wed, 18 Dec 2024
 22:31:26 -0800 (PST)
MIME-Version: 1.0
References: <20241212172209.533779-1-pbonzini@redhat.com>
 <20241212172209.533779-3-pbonzini@redhat.com>
 <Z2OjU3CdoBFI7xA8@intel.com>
In-Reply-To: <Z2OjU3CdoBFI7xA8@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 19 Dec 2024 07:31:14 +0100
Message-ID: <CABgObfYaV=70CT0WoV2_CGVfnqJbuLSwXurGg9qgrKAtxNwzSA@mail.gmail.com>
Subject: Re: [PATCH 2/7] rust: pl011: match break logic of C version
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-rust@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DQZRPm_Bbw5gyFn1BHE5wtHWAPDCFcjIbjSLztYF_PE_1734589887
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000000ad60062999ae7b"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1.116,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 19 Dec 2024 06:31:37 -0000

--00000000000000ad60062999ae7b
Content-Type: text/plain; charset="UTF-8"

Il gio 19 dic 2024, 05:20 Zhao Liu <zhao1.liu@intel.com> ha scritto:

> But when I double-check where to set up the rsr, I realized that the
> rust version and the C version seem to be inconsistent?
>
> IIUC, I guess Rust should uses to_be_bytes()[2].


Yes, that's patch 4 in this series. :)

Paolo

[*]: https://doc.rust-lang.org/std/primitive.u32.html#method.to_be_bytes
>
> Regards,
> Zhao
>
>
>

--00000000000000ad60062999ae7b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">Il gio 19 dic 2024, 05:20 Zhao L=
iu &lt;<a href=3D"mailto:zhao1.liu@intel.com">zhao1.liu@intel.com</a>&gt; h=
a scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">But=
=C2=A0when I double-check where to set up the rsr, I realized that the<br>
rust version and the C version seem to be inconsistent?<br>
<br>IIUC, I guess Rust should uses to_be_bytes()[2].</blockquote></div></di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">Yes, that&#39;s patch 4 in =
this series. :)</div><div dir=3D"auto"><br></div><div dir=3D"auto">Paolo=C2=
=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto"></div><div dir=3D"au=
to"><div class=3D"gmail_quote gmail_quote_container"><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
[*]: <a href=3D"https://doc.rust-lang.org/std/primitive.u32.html#method.to_=
be_bytes" rel=3D"noreferrer noreferrer" target=3D"_blank">https://doc.rust-=
lang.org/std/primitive.u32.html#method.to_be_bytes</a><br>
<br>
Regards,<br>
Zhao<br>
<br>
<br>
</blockquote></div></div></div>

--00000000000000ad60062999ae7b--


