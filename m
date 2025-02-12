Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tiD5w-0007ul-22
	for mharc-qemu-rust@gnu.org; Wed, 12 Feb 2025 08:48:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tiD5v-0007uZ-CA
 for qemu-rust@nongnu.org; Wed, 12 Feb 2025 08:48:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tiD5t-00037Z-T4
 for qemu-rust@nongnu.org; Wed, 12 Feb 2025 08:48:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739368081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9/puN7vrhMr6vemMc/OFxxdS8KpLR+4QfCf5x2OLsRg=;
 b=erI2fPj/qvtwO6wn5DQ1WGoCnMoiEmjjPjVk3x3DISyQpD0SvTLHJ+OOX4TIRJIYoxADpO
 oio3GurcSvb6v1uvy4fnQI+yPO6QnMqwjszcdpCsQYyglS8CjIovFOSSi4f9P8dixSlUsj
 D9WiRKZn5ValPjcTo+8fAj7PkuRr9j8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-287-JOFMsVAZPCeQIL-0W8tbtg-1; Wed, 12 Feb 2025 08:48:00 -0500
X-MC-Unique: JOFMsVAZPCeQIL-0W8tbtg-1
X-Mimecast-MFC-AGG-ID: JOFMsVAZPCeQIL-0W8tbtg_1739368079
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-38dd533dad0so2698927f8f.0
 for <qemu-rust@nongnu.org>; Wed, 12 Feb 2025 05:47:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739368079; x=1739972879;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9/puN7vrhMr6vemMc/OFxxdS8KpLR+4QfCf5x2OLsRg=;
 b=P6OHUApmr7IQkV1t+3/f3pmuJaHaW0Q8PICX5TD3eIZ9zkLVlHWmZSQiXYHSFYdXlR
 sZ0wdOU8IqWPB6+ajhAo7D2BxkJNrQmw3aqXi0GH29eAvxPC1pRUQiAqnnWEC1qkDX3i
 4KbflzWJXFz0d/hZbmRrROIqFrVrVZFnhkYafpKeoznqfDgtFlq8aPC4TVyDmMkkmuA4
 tJu8HKWWJW3YjQXiUIgDSvp2idy2pdFNWl1amHlcMyH725+qJS55UlIc67603t1zSbS6
 uxuLo48ACNZpIiAT/pvavy6dclhtR6zki2Jki9ezu866FS+4cISZi24lcqS1NeRHDOld
 Y1/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBhtnarGew6qvI5QyWKT/Cqh4vEs77O8acR6XggZ3xVlvSQKdX5slSWg/m21fTxj3ry+R7EzWl+ho=@nongnu.org
X-Gm-Message-State: AOJu0YwvHfzeZG0LddDyG8ODrdQEldAs03eTv3t8Gpu99c6EtueUOVDH
 o6ZH6wZWopJ2HXZi8GrH249KtWL7WSympl05J6EHPITXMO6iSFjJtXJgCogVVXeQH+//jSM63+u
 GNs1D55+u2ELp6bCTNuaobuELT4I642QxubLXFQ+YSQvBb6l4cgK9pJ5cSL/XFPb/bwkQTxKJ/F
 aodOE4c5jzjSBzbKAkZZITEOPXhA==
X-Gm-Gg: ASbGncvoBXxUq/qjJAlTV0YwaZzcLw76wtX6TEaqoFupPjL7gr5RztofFTlxN6sPUIJ
 onZs1Dmx26jmCtEROVXVOhcS53YbN/6ydmLrhKMh9m9FwuwRt0aaUOH/Fz9cu
X-Received: by 2002:a5d:47c3:0:b0:38d:de92:adab with SMTP id
 ffacd0b85a97d-38dea28c762mr2519664f8f.29.1739368078859; 
 Wed, 12 Feb 2025 05:47:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH4CjbaWLQBFit+3pcBhLtMHDkckx5fSXOsWQbLyirQxcQWTaGKSGSPEleMLuaKaoJ1h6ek9PxFvum5IybmXeE=
X-Received: by 2002:a5d:47c3:0:b0:38d:de92:adab with SMTP id
 ffacd0b85a97d-38dea28c762mr2519654f8f.29.1739368078564; Wed, 12 Feb 2025
 05:47:58 -0800 (PST)
MIME-Version: 1.0
References: <20250211214328.640374-1-kwolf@redhat.com>
 <20250211214328.640374-4-kwolf@redhat.com>
 <b7b2ab97-acd3-4008-abd6-3da874541113@redhat.com>
 <Z6yecuOmtQKYUwLj@redhat.com>
In-Reply-To: <Z6yecuOmtQKYUwLj@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 12 Feb 2025 14:47:46 +0100
X-Gm-Features: AWEUYZnyYP0TlHPxSEhYNXFBX1Fm88a5IJusHoC7KUH-CBYrBfe4ix0i9jBtfUg
Message-ID: <CABgObfb-MXHYY4eM5LUbiRdOqWFG_CEcM-Xkv+v_dNWMwThKHA@mail.gmail.com>
Subject: Re: [PATCH 03/11] rust: Add some block layer bindings
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, hreitz@redhat.com, manos.pitsidianakis@linaro.org, 
 qemu-devel@nongnu.org, qemu-rust@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1y4Cu_iR3Jbctrwys9ffNAp_tyA2RxSP7DVgOogMxVU_1739368079
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 12 Feb 2025 13:48:03 -0000

On Wed, Feb 12, 2025 at 2:13=E2=80=AFPM Kevin Wolf <kwolf@redhat.com> wrote=
:
> Yes, we definitely need some proper bindings there. I'm already tired of
> writing things like this:
>
>     return -(bindings::EINVAL as std::os::raw::c_int)
>
> Or even:
>
>     return e
>         .raw_os_error()
>         .unwrap_or(-(bindings::EIO as std::os::raw::c_int))

This by the way seemed incorrect to me as it should be

     return -(e
         .raw_os_error()
         .unwrap_or(bindings::EIO as std::os::raw::c_int))

(leaving aside that raw_os_error does not work on Windows)... But then
I noticed that read_raw() also does not negate, which causes the error
to print incorrectly...

> Which actually already shows that your errno binding patch does the
> opposite direction of what I needed in this series.

... so my patch already helps a bit: you can still change

    if ret < 0 {
         Err(Error::from_raw_os_error(ret))
    } else {
         Ok(())
    }

to

   errno::into_io_result(ret)?;
   Ok(())

and avoid the positive/negative confusion.

Anyhow, I guess the first one wouldn't be much better:

   return errno::into_negative_errno(ErrorKind::InvalidInput);

whereas the second could be

   return errno::into_negative_errno(e);

But then the first is already a special case; it only happens where
your bindings are not trivial thanks to the introduction of the
Mapping type.

Paolo

> My problem is when I
> need to return an int to C, and I either have an io::Result or I just
> want to directly return an errno value. So we'll have to add that part
> to your errno module, too.


