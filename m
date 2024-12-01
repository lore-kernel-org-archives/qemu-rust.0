Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tHitn-0001NO-CC
	for mharc-qemu-rust@gnu.org; Sun, 01 Dec 2024 07:18:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tHith-0001Mm-Nx
 for qemu-rust@nongnu.org; Sun, 01 Dec 2024 07:17:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tHite-0006qO-NF
 for qemu-rust@nongnu.org; Sun, 01 Dec 2024 07:17:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733055466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GfM+hv+UmRrO0wcCc3aaf+FTe3Isw++/K+lNX65f+zU=;
 b=PlwaEj46VZ5x/WTsEi1U1eWPTrdIyaB/0CJnFKKiAwusZXQ5+6wnfho7T2xBefxTzGuuyB
 zaAsTbJ41Rht53YfmzZ/KV8UjoXctoeUpOONZBDrvk/ctebulHLJIDWPFsD6hM0ru2UHbn
 4UaFvx3oBLipwClw+0OBgTD3KTuMCn4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-491-eHR9h5GRNP2kAIxNizfFcQ-1; Sun, 01 Dec 2024 07:17:45 -0500
X-MC-Unique: eHR9h5GRNP2kAIxNizfFcQ-1
X-Mimecast-MFC-AGG-ID: eHR9h5GRNP2kAIxNizfFcQ
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-385d4fa8e19so1591865f8f.2
 for <qemu-rust@nongnu.org>; Sun, 01 Dec 2024 04:17:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733055463; x=1733660263;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GfM+hv+UmRrO0wcCc3aaf+FTe3Isw++/K+lNX65f+zU=;
 b=A9stZZ/MRPo4XXTRDpFHipl5Pv15L8HfEv6wpvi7PTMcHxQbHNgoLeQ6juRiAYvDD8
 paxu8hxJxU1FhE13fE+d2g0dE21Bt0UuVDWSYdCTsnhgddXZZ6BqDZa48yw3OnqddgRc
 S63Tuo1DmKl/7ok1JhM9ER2sr6l+8WQ6JyvYa0k8ZB3s+pyv+2jyxFb/z/nPCHW562RN
 61nxNqqsbuI0pZJUaGkHzor/gesojr9CzOP7qal1VE0PLriGbOk6DwvZXrKmU1knzW9n
 KwgnEPotknsScqdAFFmRTvSlDvkRMtsT2/InO6WoWpcZW7owvV8oOvzwAwKVLMUH/+6G
 jXRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU10UB+So1wUFT6Mn/eZXrMYm0TgsUdVYdq4ZvQcyyeb5Owc5oZi+0vuMSjafZIRsRoi7kbkNrtLxA=@nongnu.org
X-Gm-Message-State: AOJu0YyD/yxUuHHx61jpfoJROUdhych4yYEG/6KFaam/trRAbSWuYSiE
 bg2JtT9tvteb5MzB7Z6JkINnXE0VdCPOYllmVWPqaDjjKaE055FUOzUD4NMn/MnaEyWwNBegX+3
 lI5xlfSv0Jr7b4qCrK4EeEiRrRMRhJiO83ucRKdantpt+q+aZ4s84yHU4GiCzR87admAIpn4DYu
 xxLXjNs1FryFPkTmwjEYz8J/3pcVOel/nRsRyU
X-Gm-Gg: ASbGncu1RshwUQYKDUdVMgh4Hx9ablqMw+uOnYZjdKMRIoQvdPyLhuD0Wrma3tHAS36
 oOnDihSoRuGCz334MuNaSep+UwZy6TONi
X-Received: by 2002:a5d:6481:0:b0:385:df4e:366f with SMTP id
 ffacd0b85a97d-385df4e3bdfmr8266602f8f.38.1733055463036; 
 Sun, 01 Dec 2024 04:17:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFkQw47DE0EnM3j7nTNOLGY/qU4MDXyFc++EM7IhIZlADxr9N7xvQdRT32GJOn2TRKJFmERNpFOFR1DmYqejNM=
X-Received: by 2002:a5d:6481:0:b0:385:df4e:366f with SMTP id
 ffacd0b85a97d-385df4e3bdfmr8266582f8f.38.1733055462674; Sun, 01 Dec 2024
 04:17:42 -0800 (PST)
MIME-Version: 1.0
References: <ab7626bb-7c77-49c9-8dc8-86d79b095e3a@pbonzini.local>
In-Reply-To: <ab7626bb-7c77-49c9-8dc8-86d79b095e3a@pbonzini.local>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sun, 1 Dec 2024 13:16:00 +0100
Message-ID: <CABgObfbdhNE6OY1JTLkYOj+7e+P+vY2s8XoSTFUPQAR9KdqJSA@mail.gmail.com>
Subject: Re: Rust in QEMU roadmap
To: qemu-devel@nongnu.org, qemu-rust@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Lvgs0z9Zch-biHYz6GXig8SwyKno8ivu3zTSUfr-sUc_1733055464
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-List-Received-Date: Sun, 01 Dec 2024 12:18:00 -0000

On Tue, Nov 26, 2024 at 6:48=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.com>=
 wrote:
> Callbacks
> '''''''''
>
> This is the least mature of the "urgent" changes, and perhaps the more
> important to have a good design for.  PL011 has callbacks for character
> devices and memory regions, but other usecases include timers, bottom
> halves and interrupt sinks (aka GPIO inputs).

Ok, I have an idea that should make it possible to write something like thi=
s:

pub struct Timer {
    t: *mut QEMUTimer,
}

impl Timer {
    // FnCall is QEMU-specific and contains all the magic.
    unsafe extern "C" fn rust_timer_cb<
        'a, T, F: FnCall<(&'a T,)>>(opaque: *mut c_void) {
        // The argument to F::call is a tuple, otherwise this is fairly exp=
ected
        F::call((unsafe { &*(opaque.cast::<T>()) },))
    }

    #[inline]
    fn new_ns<'a, T, F: FnCall<(&'a T,)>>(
        clk: QEMUClockType,
        _cb: F,
        opaque: &'a T,
    ) -> Timer {
        let cb: unsafe extern "C" fn(*mut c_void) =3D rust_timer_cb::<'a, T=
, F>;
        Timer {
            t: unsafe { bindings::timer_new_ns(clk, cb, opaque) },
        }
    }
}

and then the caller can simply write

   self.timer =3D Timer::new_ns(QEMU_CLOCK_VIRTUAL, Self::timer_update, sel=
f);

The idea is that the compiler will generate a different version of
rust_timer_cb for every value of the second argument (which is unused,
except inasmuch as it helps the compiler know what "F::call" means).
In the code above "unsafe" is only needed for the unavoidable casts
and FFI calls, while the device has no unsafe at all. I haven't
written the timer bindings but the basic idea is like the above. It
can be expanded once Zhao posts his HPET conversion.

It may also be possible to use macros to make things a little less
verbose, but I'm tending to err on the side of explicitness for now.

I'm also not sure about the applicability of this trick to character
devices and memory regions, since those have multiple callbacks and/or
callbacks in structs rather than function parameters. However, for
timers this is a good option I think.

Paolo


